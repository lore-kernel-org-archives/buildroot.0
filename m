From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 16:22:59 +0200
Subject: [Buildroot] [PATCHv2/next 4/4] docs/manual: add new section
 about the DEVELOPERS file and get-developer
In-Reply-To: <189a31d9-db1e-032c-8e79-d047b0ebed18@mind.be>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <189a31d9-db1e-032c-8e79-d047b0ebed18@mind.be>
Message-ID: <20160824162259.15fd9915@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Aug 2016 02:21:44 +0200, Arnout Vandecappelle wrote:

>  As I hinted in my reply to patch 2, I would also add this message to the end of
> the "The formatting of a patch" section in contribute.txt. Something like:
> 
> If you are interested in getting notified of build failures and of further
> changes in the packages you modified, please add yourself to the DEVELOPERS
> file. This should be done in a separate patch of the series. See
> xref:DEVELOPERS[the DEVELOPERS file] for more information.
> 
> (and add [[DEVELOPERS]] to the developers section).

Thanks for the suggestion, added.

While adding this, I noted that the references like:

   xref:label[some description]

are not rendered just has "some description" in the HTML, but as:

  "some description <the title of the section pointed to>"

For example, for:

  Before reporting any issue, please check in xref:community-resources[the mailing list archive] whether someone has

you get:

  Before reporting any issue, please check in the mailing list archive Chapter 5, Community resources whether someone has

which is not very pretty.

Maybe someone with AsciiDoc knowledge can look into this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
