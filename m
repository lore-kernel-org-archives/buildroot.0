From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Oct 2013 21:02:32 -0300
Subject: [Buildroot] Updating /etc/protocols
In-Reply-To: <CANGB_5aEjRq1=5mwPdJ8R9Q20aRdZ2JGpy2giGvz9QhMUoAfdQ@mail.gmail.com>
References: <CANGB_5aEjRq1=5mwPdJ8R9Q20aRdZ2JGpy2giGvz9QhMUoAfdQ@mail.gmail.com>
Message-ID: <526B0698.4010400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/25/2013 08:50 PM, Peter Sanford wrote:

> Today I noticed that /etc/protocols found in skeleton is quite old
> (2004) and has a number of common protocols missing from it. It looks
> like the current /etc/protocols was pulled from netbsd. Does it make
> sense to update it based on the current netbsd file[1]? 

The updated NetBSD protocols has a lot of comments/emails addresses that
would take up space [1]. You could just use some linux distribution
/etc/protocols or trim it down and send a patch.
For that matter /etc/services could be updated too.
Regards.

[1] - Not that much, but still.
