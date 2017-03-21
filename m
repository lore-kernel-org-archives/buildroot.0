From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 21 Mar 2017 12:50:06 -0400
Subject: [Buildroot] [PATCHv2] package: add qt5virtualkeyboard
In-Reply-To: <20170321173702.07dccf6c@free-electrons.com>
References: <20170321163101.11704-1-gael.portay@savoirfairelinux.com>
 <20170321173702.07dccf6c@free-electrons.com>
Message-ID: <20170321165006.ukba2feuqaavulzd@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Oops, my bad (face-palm)

On Tue, Mar 21, 2017 at 05:37:02PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 21 Mar 2017 12:31:01 -0400, Ga?l PORTAY wrote:
> > This patch adds the Qt virtualkeyboard package.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> 
> What are the changes compared to v1? This patch lacks a changelog :-)
> 
> Thanks!
> 

Changes since v1:
 - Add missing hash file
 - Add license approval statement
 - Add support for languages layouts
   Note: Chinese, Japanese and Korean does not display properly (font?)
 - Install sample if is compiled (BR2_PACKAGE_QT5BASE_EXAMPLES=y)
 - Apply reviews from Peter:
   Add version constraint: message and dependency (needs at least qt 5.8)
   Update help to mention GPLv3 license

Regards,
Gael
