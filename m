From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 22 Oct 2019 21:21:52 +0200
Subject: [Buildroot] minicom aborts
In-Reply-To: <1571690075782-0.post@n4.nabble.com>
References: <trinity-76e60e04-b256-49e6-9a96-952ff2003124-1550502581474@3c-app-mailcom-bs08>
 <20190218204417.5c943e3c@gmx.net>
 <03499d6b-bd94-b080-f5a9-53e6e0422e78@gmx.com>
 <20190219193553.21e11bc2@gmx.net>
 <a8df1aa8-806f-2abb-724c-404af07c1d77@gmx.com>
 <1571690075782-0.post@n4.nabble.com>
Message-ID: <20191022212152.4c1dfb0b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andre,

On Mon, 21 Oct 2019 15:34:35 -0500 (CDT), AndrePinto <andrealmeidap1996@gmail.com> wrote:

> Hello,
> 
> Did you fix that without modifying the code? I am facing the same problem.

Should be fixes without code modifying, run with e.g.

	LANG=en_US.utf8 minicom

in case en_US.utf8 is enabled in your buildroot config, e.g.

	BR2_GENERATE_LOCALE="en_US"

Regards,
Peter

> 
> Thanks for your attention.
> 
> Andr?.
> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
