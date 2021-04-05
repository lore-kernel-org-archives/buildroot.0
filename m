From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Apr 2021 11:49:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: add
 LIBVIPS_CPE_ID_VENDOR
In-Reply-To: <877dlh84ha.fsf@tarshish> (Baruch Siach's message of "Mon, 05 Apr
 2021 12:28:49 +0300")
References: <20210404160652.2898792-1-fontaine.fabrice@gmail.com>
 <87y2dxx187.fsf@dell.be.48ers.dk> <877dlh84ha.fsf@tarshish>
Message-ID: <87im51uklm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sun, Apr 04 2021, Peter Korsgaard wrote:
 >>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 
 >> > cpe:2.3:a:libvips_project:libvips is a valid CPE identifier for this
 >> > package:
 >> 
 >> >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibvips_project%3Alibvips
 >> 
 >> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> 
 >> Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

 > Not in origin/2020.11.x or origin/2020.02.x as of commits f748088fa65b
 > and eed984e34a693, respectively.

Sorry, just me pressing the wrong macro. The CPE identifiers only make
sense for 2021.02.x, so I've only added it there.

Thanks for the heads up!

-- 
Bye, Peter Korsgaard
