[ROOT](https://root.cern.ch/) is a toolkit developed at [CERN](https://home.cern/). Its primary audience is particle physicists who want to perform data analysis.

```
sudo docker run -p 8080:8080 -v $PWD:/work aluschumacher/jupyter-pyroot
```

To change the host port mapping to a different port than 8080 change the first `8080` to the desired port number. To change the mapping from the internal container `/work` directory to some other host directory, change the `$PWD` to the desired directory. 

Based on [wgseligman/docker-jupyter-pyroot](https://github.com/wgseligman/docker-jupyter-pyroot).
