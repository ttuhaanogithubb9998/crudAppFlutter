abstract class AbstractRepository<M, I> {
  Future<List<M>> findAll();
  Future<M> findById(I i);
  Future<M> update(M m);
  Future<M> create(M m );
  Future<M> delete(M m);

  

}
