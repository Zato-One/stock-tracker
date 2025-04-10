package cz.savic.stocktracker.core.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "supplier")
@Data
public class Supplier {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 255)
    private String name;

    @Column(length = 100)
    private String email;

    @Column(length = 20)
    private String phone;

}
