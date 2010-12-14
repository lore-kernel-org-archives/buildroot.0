From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 14 Dec 2010 08:05:48 +0100
Subject: [Buildroot] can't compile mplayer for ARM with actual buildroot
	5a6f6bfe885754955b615ca9353baa3496682c6f
In-Reply-To: <87d3p5i34o.fsf@macbook.be.48ers.dk>
References: <AANLkTimto_ZpVXosSAAv8YtVS6o+o94y12MU3mx5cOcj@mail.gmail.com>
	<20101213174444.3b328c36@surf>
	<AANLkTinqjw_EqtmNnj6+rTzHDFdoVov34aDTOo4VpkNQ@mail.gmail.com>
	<20101213205936.10a69e66@surf> <87d3p5i34o.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTi=Vv3zoN5NvFaEeu5TOK5hX6dTBe=S_tn7kFddo@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 14, 2010 at 1:56 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> ?Thomas> On Mon, 13 Dec 2010 19:30:57 +0100
> ?Thomas> Belisko Marek <marek.belisko@gmail.com> wrote:
>
> ?>> Sorry for spamming. My mistake. I accidently select arm920 not arm926t.
> ?>> It's correct now.
>
> ?Thomas> Well, even with arm920 it should still build. But I'd prefer to look at
> ?Thomas> those issues once the newer mplayer package is merged, since it has
> ?Thomas> quite significantly improved how processor-specific optimizations are
> ?Thomas> handled.
>
> It's merged now. Care to retest?
I'm behind proxy and get this(try more times) :
>>> mplayer 32710 Downloading
svn: Can't connect to host 'svn.mplayerhq.hu': No route to host
--2010-12-14 08:01:36--  http://sources.buildroot.net//mplayer-32710.tar.gz
Resolving sources.buildroot.net... 88.198.64.109
Connecting to sources.buildroot.net|88.198.64.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-12-14 08:01:36 ERROR 404: Not Found.

and then:
>>> mplayer 32710 Downloading
svn: Can't connect to host 'svn.mplayerhq.hu': Connection timed out
--2010-12-14 08:06:41--  http://sources.buildroot.net//mplayer-32710.tar.gz
Resolving sources.buildroot.net... 88.198.64.109
Connecting to sources.buildroot.net|88.198.64.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-12-14 08:06:42 ERROR 404: Not Found.

So now not sure if I understand correctly that source should be get to
sources.buildroot.net with svn and then downloaded via wget to me?

Thanks for clarification ;)
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
