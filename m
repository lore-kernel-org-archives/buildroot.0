From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 09:23:44 -0300
Subject: [Buildroot] [PATCH 00/15] Drop non-largefile support
In-Reply-To: <20150314225805.GR4009@free.fr>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <20150314225805.GR4009@free.fr>
Message-ID: <55081CD0.2080108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/14/2015 07:58 PM, Yann E. MORIN wrote:

> I've reviewed all but patch 12 and 14, they are pretty big but I don't
> expect you fubared those! ;-)

Probably not for 12 except for maybe new packages after this gets applied.
For 14 it was a best effort based on comments and code logic, i kept
some patches that keep the warnings down (redefinition of
FILE_OFFSET_BITS and so) for example.
Regards.
