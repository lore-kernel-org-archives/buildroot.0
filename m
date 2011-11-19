From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2011 13:13:23 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <CAEYzJUEmGkit9PXw-Ek-f871U0d54A+uV0Ohv6N8DnMvjP6oMA@mail.gmail.com>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <201111181927.41880.arnout@mind.be>
 <CAEYzJUEmGkit9PXw-Ek-f871U0d54A+uV0Ohv6N8DnMvjP6oMA@mail.gmail.com>
Message-ID: <201111191313.24069.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 19 November 2011 10:26:17 Bj?rn Forsman wrote:
> On 18 November 2011 20:27, Arnout Vandecappelle <arnout@mind.be> wrote:
> >  With the commit ID, it is still pretty difficult to find out if a partical release contains it.
                                                                       ^^^^^^^^
                                                           I meant "particular"
> 
> git describe --contains <commit-id>
> 
> I just learned it! :-)

 Yes, but then you have to clone the repository, while normally when you're
bumping a version you just download the release tar.

 But thanks for the tip.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111119/031e6465/attachment.html>
