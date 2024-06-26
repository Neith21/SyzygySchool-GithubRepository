﻿
namespace DEMO_PuellaSchoolAPP.Data
{
    public interface ISqlDataAccess
    {
        Task<IEnumerable<T>> GetData1Async<T, U, V, P>(string storedProcedure, P parameters, Func<T, U, V, T>? map = null, string connection = "default", string splitOn = "Id");
        Task<IEnumerable<T>> GetData2Async<T, U, V, W, P>(string storedProcedure, P parameters, Func<T, U, V, W, T>? map = null, string connection = "default", string splitOn = "Id");
        Task<IEnumerable<T>> GetDataAsync<T, P>(string storedProcedure, P parameters, string connection = "default");
        Task<IEnumerable<T>> GetDataAsync1<T, U, P>(string storedProcedure, P parameters, Func<T, U, T>? map = null, string connection = "default", string splitOn = "Id");
        Task SaveDataAsync<T>(string storedProcedure, T parameters, string connection = "default");
    }
}