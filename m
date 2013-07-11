From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Jul 2013 11:28:17 -0300
Subject: [Buildroot]
 =?windows-1252?q?Error_while_installing_dosfstools=3A?=
 =?windows-1252?q?_mkdosfs=92=3A_No_such_file_or_directory?=
In-Reply-To: <alpine.LSU.2.10.1307111112110.7453@schiller.dip.t-dialin.net>
References: <CAF3SDA4DY8DkDTVr5F4aLxmoJha60Y4DnZ9yC0u7PdhteR3Svg@mail.gmail.com>
 <87obaciyn8.fsf@dell.be.48ers.dk>
 <CAF3SDA7tGGeJfP2kJcf9Hy6Z4KrqUhHV0E1JBTE+0x+-bCMEMw@mail.gmail.com>
 <87bo6ci9xk.fsf@dell.be.48ers.dk> <51DD6469.4010504@gmail.com>
 <20130710185808.56c3ac52@skate> <51DD94D9.6060001@zacarias.com.ar>
 <87y59efgfj.fsf@dell.be.48ers.dk>
 <alpine.LSU.2.10.1307111112110.7453@schiller.dip.t-dialin.net>
Message-ID: <51DEC101.6080606@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/2013 06:33 AM, Schleusener, Jens wrote:

> 2) Changed behaviour: fossies.org now issued a "410 Gone" HTTP status
> with some information in the HTML code about the reason together with a
> link to the current (only) available newer version of the requested
> package tarball.
> 
> 3) Remark: fossies.org isn't a mirror and is unsuitable for downloading
> special legacy versions since it tries to offer only "fresh" current
> versions. The sha1sum of an software archive is also available via for e.g.
>  http://fossies.org/linux/misc/dosfstools-3.0.20.tar.gz/sha1
> or visible at the bottom of the contents file of the software archive
>  http://fossies.org/linux/misc/dosfstools-3.0.20.tar.gz/
> The current contents file of an software archive incl. download links is
> version-indepent always accessible via short-URLs specifying just the
> software basename, for e.g.
>  http://fossies.org/dosfstools
> 
> Regards
> 
> Jens

410 is fine, now it'll fall back on the buildroot mirror for sources
which is best.
For newer releases the URL was switched to
http://daniel-baumann.ch/files/software/dosfstools/ which seems to keep
old versions around.
So everything is fine now, thanks.
Regards.
