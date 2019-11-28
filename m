From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 17:08:25 +0100
Subject: [Buildroot] [PATCH] package/postgresql: fix filesystem naming
 consistency
In-Reply-To: <2997576693-13830@mail.unilogic.nl> (Pascal de Bruijn's message
 of "Thu, 28 Nov 2019 16:40:51 +0100")
References: <2997576693-13830@mail.unilogic.nl>
Message-ID: <87eexsgf0m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

Hi,

 >> - ? ? ? pgsql (the command line interpreter), which offers 
 >> + ? ? ? psql (the command line interpreter), which offers 
 
 > This doesn't seem to be related to the commit. Also, is the command 
 > line tool really called psql ? 

 > Yes, it's not directly related, but just a minor typo fix.

 > The command is indeed called psql.

Ok, could you send a separate patch just for that typo so we can apply
it to master? The path change looks like next material to me.

-- 
Bye, Peter Korsgaard
