From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 09:43:09 +0100
Subject: [Buildroot] nightly.buildroot.org: 404 - Not Found
In-Reply-To: <20180128054114.wpfskw5533ei2o7w@tarshish> (Baruch Siach's
 message of "Sun, 28 Jan 2018 07:41:14 +0200")
References: <20180128054114.wpfskw5533ei2o7w@tarshish>
Message-ID: <87mv0yfk6a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Buildroot list,
 > The link to the nightly built manual is now leading to "404 - Not Found":

 >   http://nightly.buildroot.org/manual.html

 > The same goes for both other Nightly links on https://buildroot.org/docs.html.

 > http://nightly.buildroot.org/ shows a generic lighttpd welcome page.

 > I guess this has something to do with the recent changes in the buildroot.org 
 > DNS configuration.

Thanks for the heads up. It is indeed somewhat related as
nightly.buildroot.org (but not nightly.buildroot.net) was a CNAME to
sources.buildroot.org, which is now pointing to the new VM.

I've fixed that now. I will also move the nightly manual stuff to the
new VM in the near future, so there may be some mall hickups.

Let me know if you notice anything else odd.

-- 
Bye, Peter Korsgaard
