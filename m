From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 04 Feb 2013 20:30:55 -0300
Subject: [Buildroot] [PATCH 02/10] dialog: add license information
In-Reply-To: <87obfzy91n.fsf@dell.be.48ers.dk>
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
 <1359483839-25357-2-git-send-email-gustavo@zacarias.com.ar>
 <87zjzrbphn.fsf@dell.be.48ers.dk> <51084F9E.6080408@zacarias.com.ar>
 <87obfzy91n.fsf@dell.be.48ers.dk>
Message-ID: <511044AF.8080700@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/2013 08:05 PM, Peter Korsgaard wrote:

> Ahh, you're right. So we have 33 .c files (including the main one) not
> listing 'or later', and a single one which does.
> 
> What does that mean?

Unfortunately it seems to be quite a debate, see:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=632198
Problem is that one file says "or later" and the rest doesn't.
I'm not a lawyer and with the authors comment clarifying that most of
the worst isn't "or later" it's safe to say it's not since one file
can't virally affect all the others.
It's a very thin line to walk on though.
Regards.
