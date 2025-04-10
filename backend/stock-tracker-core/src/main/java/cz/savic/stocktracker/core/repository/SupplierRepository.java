package cz.savic.stocktracker.core.repository;

import cz.savic.stocktracker.core.entity.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SupplierRepository extends JpaRepository<Supplier, Long> {
}
