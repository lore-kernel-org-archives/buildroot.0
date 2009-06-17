From: Will Newton <will.newton@gmail.com>
Date: Wed, 17 Jun 2009 17:23:18 +0100
Subject: [Buildroot] Problem making buildroot
In-Reply-To: <24075410.post@talk.nabble.com>
References: <24075410.post@talk.nabble.com>
Message-ID: <87a5b0800906170923i19d6c70bkb0966ed81633293c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 17, 2009 at 4:25 PM, jdzielski<jdzielski@stevens.edu> wrote:
>
> Sorry if this is a multiple post. ?It's showing up in the list that I see but
> there is an indication that he message hasn't been accepted.
>
> Hi,
> ? ?I'm new at trying to do things at this level, but I'm trying to make the
> buildroot on Ubuntu 8.04. ?I've been following the instructions at
> http://docwiki.gumstix.org/index.php/Buildroot which is pretty straight
> forward. ?There were a couple errors that I managed to fix, but I've reached
> a point where I'm not sure what the make file is trying to do. ?The command
> that is being executed by the main make is:

I believe that the problem is caused by a combination of an old
binutils and a newer version of texinfo. Try using a newer binutils if
possible.
