From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 22:13:55 +0100
Subject: [Buildroot] [PATCH] package/musl: remove rcrt1.o from target
 installation
In-Reply-To: <CADYdroMAZ12BZH6q5472gAOuuDfT5RQVXA3SP1ts=7cW2yhGrQ@mail.gmail.com>
 (Norbert Lange's message of "Wed, 6 Mar 2019 18:09:19 +0100")
References: <20190306163316.6117-1-norbert.lange@andritz.com>
 <20190306174841.4f8b67a1@windsurf>
 <CADYdroMAZ12BZH6q5472gAOuuDfT5RQVXA3SP1ts=7cW2yhGrQ@mail.gmail.com>
Message-ID: <87a7hik67g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

 >> 
 >> Could you give some more details ?


 >  rcrt1.o is a new startup for "static-pie" apps, and only needed for building,
 > should not end up in the target filesystem

Committed to 2019.02.x after adding this description, thanks.

-- 
Bye, Peter Korsgaard
