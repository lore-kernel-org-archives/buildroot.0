From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Nov 2015 15:23:26 -0300
Subject: [Buildroot] [PATCH] libgsasl: fix auto dependencies
In-Reply-To: <20151126192243.098b65ea@free-electrons.com>
References: <1448560021-14096-1-git-send-email-gustavo@zacarias.com.ar>
 <20151126192243.098b65ea@free-electrons.com>
Message-ID: <56574E1E.60802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/11/15 15:22, Thomas Petazzoni wrote:

> It is not immediately clear why --without-stringprep is used here
> instead of --without-libidn, so this probably warrants a comment in the
> code or at least in the commit log.

Hi, the usual, upstream are inconsistent morons ;)
Regards.
