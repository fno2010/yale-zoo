yale-zoo 
======== 

**The helper of <https://zoo.cs.yale.edu/> for zsh.**

How to install
--------------

If you use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), you can just
clone this repo into your `~/.oh-my-zsh/custom/plugins/` directory, and modify
your `~/.zshrc` file like following:

``` zsh
plugins=(
    # your other enabled plugins
    # ...
    yale-zoo
)
```

Or you can just `source` the file `yale-zoo.plugin.zsh` in your own `.zshrc`
file.

Then you need to create your own configuration file to load some basic
environment variables.

You can just copy from the template file:

``` zsh
$ mv yale-zoo-config.example yale-zoo-config
```

And then modify your own information:

``` zsh
ZOO_USER=your_net_id
```

How to use
----------

This helper will define a new zsh function called `sshz`. Currently, it
provides the following features:

1. list all available zoo nodes:

Notes: this feature requires [pup](https://github.com/ericchiang/pup) is
installed.

``` zsh
$ sshz
viper
hornet
cricket
newt
termite
python
cicada
bumblebee
cobra
...
```

2. Complete the zoo nodes name:

``` zsh
$ sshz c<TAB>
cardinal   chameleon  cicada     cobra      cricket
```

3. ssh to a zoo node with zsh environment:

``` zsh
$ sshz cobra
➜  ~
````

``` zsh
# You can follow any ssh arguments
$ sshz cobra hostname
cobra.zoo.cs.yale.edu

$ sshz cobra -XY
Warning: No xauth data; using fake authentication data for X11 forwarding.
Last login: Wed Dec  5 18:25:04 2018 from 172.27.153.169
/*                                 Welcome!
 *
 * ANNOUNCEMENTS: Please do not power off Zoo workstations or their monitors.
 *                If you are missing a course directory, create it with
 *                $ sudo register csXYZ
 *                Please report any issues to cs.support@yale.edu.
 * NODE REBOOTS:  Wednesdays, 07:30
 */
[jz675@cobra ~]$ echo $DISPLAY
localhost:10.0
```
