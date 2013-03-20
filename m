From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Mar 2013 14:49:24 +0100
Subject: [Buildroot] [PATCH 2/5] manual: add a make target
 'manual-update-lists'
In-Reply-To: <CAKAx1cicUqrkg1Q1VHZQAzPc7YivcfiJdEZoJ9DbErazMiN2CQ@mail.gmail.com>
References: <cover.1363063387.git.s.martin49@gmail.com>
 <da0b536e458646ecade2fd7d2a8cee2e04148e66.1363063387.git.s.martin49@gmail.com>
 <20130312085945.7d595fb2@skate>
 <CAHXCMMJMP5o34AAX29Rx0HqWOtysCz4bFJNrMo+pyHYBf0++fg@mail.gmail.com>
 <20130313083959.49853d83@skate>
 <CAHXCMMJenyhQiKPp+vKbcM_c280ghGVeAG9tsGxtXnR0s3b0CA@mail.gmail.com>
 <20130320092540.4b14570b@skate>
 <CAKAx1cicUqrkg1Q1VHZQAzPc7YivcfiJdEZoJ9DbErazMiN2CQ@mail.gmail.com>
Message-ID: <20130320144924.53b66373@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Wed, 20 Mar 2013 13:58:26 +0100, Lionel Orry wrote:

> Can I suggest something like adding this line at the beginning of the manual:
> 
> Manual generated from git revision {sys:git rev-parse HEAD} on
> {docdate} {doctime}.
> 
> This avoids an extra file generation, asciidoc can do it by itself.

Sounds even better! Thanks for the suggestion.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
