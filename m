From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Dec 2012 07:52:26 -0300
Subject: [Buildroot] [PATCH 2/2] dnsmasq: bump to version 2.64
In-Reply-To: <87ip8atftj.fsf@dell.be.48ers.dk>
References: <1354840348-24951-1-git-send-email-gustavo@zacarias.com.ar>
 <1354840348-24951-2-git-send-email-gustavo@zacarias.com.ar>
 <87ip8atftj.fsf@dell.be.48ers.dk>
Message-ID: <50C5BEEA.8040209@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/2012 06:30 AM, Peter Korsgaard wrote:

> It unfortunately fails here:
> 
> http://autobuild.buildroot.net/results/26a9e152f533e467f68b72a373d0fc84d561eb87/build-end.log
> 
> From a quick look, it seem parse_server() should be moved outside the
> HAVE_DHCP conditional.

Thanks for the headsup, patch sent (to both relevant places) :)
regards.
