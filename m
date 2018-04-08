From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 8 Apr 2018 17:09:05 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-04-07
In-Reply-To: <20180408060016.A832E207F1@mail.bootlin.com>
References: <20180408060016.A832E207F1@mail.bootlin.com>
Message-ID: <0b0ee2f6-734d-0e39-c0d1-0a5c4592e556@dawncrow.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Am 08.04.2018 um 08:00 schrieb Thomas Petazzoni:
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2018-04-07, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> ===============================
> 
> Build failures related to your packages:
> 
>          arc |     azure-iot-sdk-c-2018-03-16 | http://autobuild.buildroot.net/results/35f9f7a4adc6c2cad741079e4afdf1408c94703b
>          arc |     azure-iot-sdk-c-2018-03-16 | http://autobuild.buildroot.net/results/258a0d3e7d40ed2d558127d9d201a8d21c219f0d
>  powerpc64le |     azure-iot-sdk-c-2018-03-16 | http://autobuild.buildroot.net/results/3197c847eb12aebc3509a7e11741530df57d2f14
>         i686 |     azure-iot-sdk-c-2018-03-16 | http://autobuild.buildroot.net/results/70c9a898a5ef148acc92fb505a8d2608b8ac485a
> 

Hi,

I already have another mail with one failure of this kind.
It all comes down to a broken setup it seems to me:

> [3m>>> azure-iot-sdk-c 2018-03-16 Downloading[23m
> Initialized empty Git repository in /home/peko/autobuild/instance-0/dl/azure-iot-sdk-c/git/.git/
> Unknown option: -C
> usage: git [--version] [--help] [-c name=value]
>            [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
>            [-p|--paginate|--no-pager] [--no-replace-objects] [--bare]
>            [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
>            <command> [<args>]

...

> [3m>>> azure-iot-sdk-c 2018-03-16 Downloading[23m
> fatal: No such remote 'origin'
