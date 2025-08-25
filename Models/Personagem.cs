using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProjetoDBZ.Models
{
    public class Personagem
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "O nome do personagem é obrigatório!")]
        [MaxLength(50, ErrorMessage = "O nome do personagem não pode exceder 50 caracteres!")]
        [MinLength(3, ErrorMessage = "O nome do personagem deve ter no mínimo 3 caracteres!")]
        public string? Nome { get; set; }
        public string? Tipo { get; set; }
    }
}