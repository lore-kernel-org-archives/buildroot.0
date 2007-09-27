From: Alexander Kriegisch <Alexander@Kriegisch.name>
Date: Thu, 27 Sep 2007 13:23:52 +0200
Subject: [Buildroot] C Compiler cannot create executables
In-Reply-To: <1190888809.6244.7.camel@PcNacho>
References: <1190888809.6244.7.camel@PcNacho>
Message-ID: <46FB92C8.6090300@Kriegisch.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Posting a bit of log output would be helpful, so here is just an
educated guess: I sometimes get errors like this if there is something
wrong with my build prerequisites or with ccache. Usually it helps to
issue a manual recompile of your build prerequisites (e.g. libs your
package depends on) in order for the "compiler cannot create
executables" thing to disappear.

Regards
--
Alexander Kriegisch


Ignacio Lorenzo Subir? Otal:
> Hi!, I'm having this error while making a make in buildroot and I don't
> know why because I have been using gcc to compile several other programs
> and works fine for me.
> What can I do to avoid this error?.
