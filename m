From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 26 Jan 2017 20:52:21 +0100
Subject: [Buildroot] Relocatable internal toolchain
In-Reply-To: <CAHXCMML2HKsOgxZRLpcMbCY8Lci6-N_s1+qVTRxCHqyvP+rzgg@mail.gmail.com>
References: <57c96cfd-7d0c-c9de-04d2-2da8f5dd7f7c@grandegger.com>
 <CAHXCMML2HKsOgxZRLpcMbCY8Lci6-N_s1+qVTRxCHqyvP+rzgg@mail.gmail.com>
Message-ID: <106106629.g65udkzLeW@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Samuel,

On Thursday 26 January 2017 11:47:58 Samuel Martin wrote:
> On Thu, Jan 26, 2017 at 9:25 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
[...]
> - Cleaning up RPATH in target binaries is delayed.

For information, in my "Reproducible build" series, I wrote patches that
remove erroneous RPATH  entries from target binaries. It is implemented
by patches 11 to 19:

   http://lists.busybox.net/pipermail/buildroot/2016-December/thread.html#180130


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
