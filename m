From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Dec 2018 14:54:18 -0700
Subject: [Buildroot] [PATCH 1/1] docs/website: consolidate CDN's and
 enable SRI
In-Reply-To: <20181218224236.1526f531@windsurf>
References: <1545162134-9340-1-git-send-email-james.hilliard1@gmail.com>
 <20181218224236.1526f531@windsurf>
Message-ID: <CADvTj4qfHOhp01mrybhMmbkGAvRyJDHHG96UN=oX6L1k465yuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 18, 2018 at 2:42 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Wed, 19 Dec 2018 03:42:14 +0800, james.hilliard1 at gmail.com wrote:
> > From: James Hilliard <james.hilliard1@gmail.com>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> An empty commit log is almost never a good thing. What is SRI ? Why do
> we want this ?
https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity
It prevents the CDN from replacing assets with a malicious versions.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
