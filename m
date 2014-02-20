From: =?ISO-8859-1?Q?Peter_K=FCmmel?= <syntheticpp@gmx.net>
Date: Thu, 20 Feb 2014 10:38:16 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-19
In-Reply-To: <20140220073007.A2D9E100B89@stock.ovh.net>
References: <20140220073007.A2D9E100B89@stock.ovh.net>
Message-ID: <5305CD08.2090307@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20.02.2014 08:30, Thomas Petazzoni wrote:
> Build statistics for 2014-02-19
> ===============================
>
...
>
> Detail of failures
> ===================
>
...
>        sh4a |          qt5connectivity-5.2.0 | NOK | http://autobuild.buildroot.net/results/299add08b0d96d37bccc599dc3945691a44ade37/

Project ERROR: Unknown module(s) in QT: quick

--> no BR2_PACKAGE_QT5DECLARATIVE=y in defconfig, if declarative is not selectable maybe OpenGL support is disabled.


>      x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/8daa391d83bfb3af3ddac0a6fd60dd0c1b0ce067/
>         sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/bfde4e44bc40189082ef281c576d278919ef55f8/
>        sh4a |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/928a416b5beec9667985233a15e40364c53d08d0/
>         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/fdf8bc7660ac251792d0542d2729ea22753d3789/
>
>
