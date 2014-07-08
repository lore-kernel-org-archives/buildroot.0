From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 08 Jul 2014 19:04:56 -0300
Subject: [Buildroot] [PATCH 09/13] makedevs: add license information
In-Reply-To: <87tx6rv7b0.fsf@dell.be.48ers.dk>
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>	<1404304811-27480-9-git-send-email-gustavo@zacarias.com.ar>
 <87tx6rv7b0.fsf@dell.be.48ers.dk>
Message-ID: <53BC6B08.5070805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/08/2014 07:01 PM, Peter Korsgaard wrote:

> Why? It has a GPLv2 header and is part of Buildroot, so it should be
> GPLv2. It doesn't really matter though as the legal-info doesn't do
> anything when the packages doesn't have a _SOURCE.

True, it's GPL, probably floating letter syndrome after looking at so
many licenses.
Well, it does nothing but it should since there are other sources in the
tree that are likely not GPL (example: mcookie).
Regards.
