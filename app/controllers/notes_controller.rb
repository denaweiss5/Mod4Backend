class NotesController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }

    def index
        notes = Note.all
        render json: notes, except: [:created_at, :updated_at]
    end

    def show
        note = Note.find_by_id(params[:id])
        render json: note, except: [:created_at, :updated_at]
    end

    def create
        note = Note.new(notes_params)
        if note.save 
            render json: note, except: [:created_at, :updated_at]
        else 
            render json: {error: note.errors.full_messages}
        end
    end
    
    def update
        note = Note.find_by_id(params[:id])
        if note.update(notes_params)
            render json: note, except: [:created_at, :updated_at]
        else 
            render json: {error: note.errors.full_messages}
        end
    end

    def destroy
        note = Note.find_by_id(params[:id])
        if note.destroy
            render json: note, except: [:created_at, :updated_at]
        else
            render json: {error: "Something went wrong, cannot delete Note."}
        end
    end


    private

    def notes_params
        params.require(:note).permit(:title, :content, :user_id)
    end

end
