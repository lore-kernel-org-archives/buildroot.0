From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Nov 2010 10:27:03 +0100
Subject: [Buildroot] [PATCH 1/2] Create X symlink for TinyX
In-Reply-To: <20101104085833.30286.42896.stgit@localhost.localdomain> (Paulius
	Zaleckas's message of "Thu, 04 Nov 2010 10:58:33 +0200")
References: <20101104085833.30286.42896.stgit@localhost.localdomain>
Message-ID: <87pquk3yu0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> When installing TinyX to target create /usr/bin/X symlink
 Paulius> to Xfbdev as it is the only TinyX driver we build.
 Paulius> This makes utils like startx happy :)

Committed, thanks.

-- 
Bye, Peter Korsgaard
