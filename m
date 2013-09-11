From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Tue, 10 Sep 2013 21:06:19 -0500
Subject: [Buildroot] [PATCH 1/3] Makefile: factorize *config dependencies
In-Reply-To: <1378646129-4167-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OF168898BB.67638643-ON86257BE3.000B8BCB-86257BE3.000B926A@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/08/2013 
08:15:27 AM:

> All of the *config targets have common dependencies. Currently, the
> only common dependency is the 'outputmakefile' target, but as we are
> going to add one more, it makes sense to factorize these common
> dependencies under the COMMON_CONFIG_DEPS variable.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Ryan Barnett <rjbarnet@rockwellcollins.com>



Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/e6ac348b/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/e6ac348b/attachment-0001.gif>
