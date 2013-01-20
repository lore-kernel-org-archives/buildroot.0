From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 20 Jan 2013 09:28:49 -0300
Subject: [Buildroot] [PATCH] gettext: fix static build failure
In-Reply-To: <87wqv8dyil.fsf@dell.be.48ers.dk>
References: <1358597185-7602-1-git-send-email-gustavo@zacarias.com.ar>
 <87wqv8dyil.fsf@dell.be.48ers.dk>
Message-ID: <50FBE301.8070201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/2013 05:55 AM, Peter Korsgaard wrote:

> Committed, thanks.
> 
> We arguably should install the .a file to the target then, but as
> target-gcc is going away ..

Yes, completely on purpose.
There are probably other packages that don't do it either, so there's
not much point in looking around and fixing it for an option that's
going away.
Regards.
