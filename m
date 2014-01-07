From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 7 Jan 2014 11:17:14 +0000
Subject: [Buildroot] [PATCH] vlc: new package
In-Reply-To: <20140107033917.GD4503@tarshish>
References: <1389046142-12472-1-git-send-email-spdawson@gmail.com>
 <20140107033917.GD4503@tarshish>
Message-ID: <CAHt8ZCP=Xicy5PWy7rd_i-YfwPO0KjV5imeKacOSwg0fWMtmLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch. Thanks for the feedback.

On 7 January 2014 03:39, Baruch Siach <baruch@tkos.co.il> wrote:
> My uClibc toolchain has spawn.h as well. Is this a specific feature that is
> missing in uClibc?

Are you sure that spawn.h is present? My uClibc 0.9.33.2 doesn't have
it, and I can't see where it would come from... Apparently, the spawn
function family is not currently supported in uClibc.

Simon.
