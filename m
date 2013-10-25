From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 25 Oct 2013 16:54:50 -0500
Subject: [Buildroot] [PATCH 3/5] python-thrift: fix cross building
In-Reply-To: <1382703323-31038-3-git-send-email-gustavo@zacarias.com.ar>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
 <1382703323-31038-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <OFC275C0BB.0A26E005-ON86257C0F.00783EBC-86257C0F.00785B3D@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote on 10/25/2013 07:15:21 
AM:

> The C code (fastbinary.so) wasn't built using the cross compiler, hence
> it was unusable. Fix it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

> ---
>  package/python-thrift/python-thrift.mk | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
