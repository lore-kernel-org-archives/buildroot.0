From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 24 Jul 2009 10:46:30 -0300
Subject: [Buildroot] [git commit] CHANGES: add #163 + #473
In-Reply-To: <20090724153528.7103ad9d@surf>
References: <20090724055230.2080B77660@busybox.osuosl.org>	<20090724110230.3f51597a@surf>
	<87zlauutcd.fsf@macbook.be.48ers.dk> <20090724153528.7103ad9d@surf>
Message-ID: <4A69BB36.5070108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:

> BTW, was Perl already a host dependency to run Buildroot ?

It probably should be if it's not yet so, some packages depend on it for
building, off the top of my head i'd say openssl, it's Configure script
is integrally made in perl.
Also someone update the TODO, i think it's a bit outdated :)
Regards.
