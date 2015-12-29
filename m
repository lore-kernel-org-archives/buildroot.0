From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 22:42:50 +0100
Subject: [Buildroot] [PATCH v2] mongoose: bump to version 6.1
In-Reply-To: <1450129494-5625-1-git-send-email-zinosat@tiscali.it> (Davide
 Viti's message of "Mon, 14 Dec 2015 22:44:54 +0100")
References: <1450129494-5625-1-git-send-email-zinosat@tiscali.it>
Message-ID: <87oad9c4o5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Davide" == Davide Viti <zinosat@tiscali.it> writes:

>  - provide only libmongoose.a
>  - rework package description

> Signed-off-by: Davide Viti <zinosat@tiscali.it>
> ---
> Changes v1 -> v2:
>    - Compile only libmongoose.a (suggested by Peter Korsgaard)
>    - Remove init scripts
>    - Rework package description (Config.in)
>    - Make sure the update does not break swupdate which provides its own
>      version of mongoose (suggested by Peter Korsgaard)

Committed after moving it under Libraries->Networking as that is really
what it is now, thanks!

-- 
Bye, Peter Korsgaard
