From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Apr 2014 12:08:14 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.18.10
In-Reply-To: <20140425164709.7c1ef6e9@skate>
References: <1398166043-5569-1-git-send-email-gustavo@zacarias.com.ar>
 <20140425164709.7c1ef6e9@skate>
Message-ID: <535A7A5E.4050008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/25/2014 11:47 AM, Thomas Petazzoni wrote:
> This is causing some build failures (though not sure they are only
> related to this bump) :
> 
>   http://autobuild.buildroot.org/results/7be/7be0e42278657bd693dca9238ff3d7b66d601f32/build-end.log

As i've said before, upgrade that toolchain, it's using a border minimal
required gcc, i'm pretty sure it has issues (4.6.0 IIRC).
It's been this way for this toolchain starting from mpd 0.18
Regards.
