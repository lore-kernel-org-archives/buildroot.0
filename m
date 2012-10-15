From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Oct 2012 10:22:45 -0300
Subject: [Buildroot] [PATCHv5 2/5] packages: switch to host-pkgconf
In-Reply-To: <87sj9fx4dn.fsf@macbook.be.48ers.dk>
References: <1350302313-17344-1-git-send-email-gustavo@zacarias.com.ar>
 <87sj9fx4dn.fsf@macbook.be.48ers.dk>
Message-ID: <507C0E25.5040106@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/15/12 10:16, Peter Korsgaard wrote:

> There recently was a (misdirected) mail about rrdtool not working
> correctly with pkgconf:
> 
> http://lists.freedesktop.org/archives/pkg-config/2012-October/000904.html
> 
> Is that an issue for us or does the STAGING_DIR prefix mean pkgconfig
> never outputs nothing?

It doesn't seem to be an issue for us, i'm regularly building rrdtool
and collectd against it with host-pkgconf without any issue.
With that said, Gentoo's newest pkgconf is 0.8.7 and i'm going for 0.8.9
The biggest issue now is that upstream tarballs are gone as of this
writing (was checking if there was a new version) :-/
We can go for github though.
Regards.
