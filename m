From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 12 Nov 2013 09:25:51 -0300
Subject: [Buildroot] [PATCH] audiofile: needs dynamic library
In-Reply-To: <87k3gd4xmn.fsf@dell.be.48ers.dk>
References: <1384244924-31625-1-git-send-email-spdawson@gmail.com>	<87ob5p4zix.fsf@dell.be.48ers.dk>
 <52821764.5060109@zacarias.com.ar> <87k3gd4xmn.fsf@dell.be.48ers.dk>
Message-ID: <52821E4F.7060201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/2013 09:23 AM, Peter Korsgaard wrote:

> Yes, but I've just tested with an external toolchain where libstdc++.a
> IS copied to staging, and same problem.

Yes, fixing libstdc++.a on the internal toolchain solves the nettle
issue, but it doesn't solve audiofile (tested here with a quick hack).
Regards.
