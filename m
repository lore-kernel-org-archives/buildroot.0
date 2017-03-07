From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 13:47:45 +0100
Subject: [Buildroot] [PATCH 1/1] pcre: Change download location
In-Reply-To: <20170306212039.4134ccee@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 6 Mar 2017 21:20:39 +0100")
References: <5f582368-797e-10ad-1c19-a998496cabbf@ya.ru>
 <20170306212039.4134ccee@free-electrons.com>
Message-ID: <87d1dtdzim.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 6 Mar 2017 03:02:02 +0300, Oleg Kitain wrote:
 >> Subject: [PATCH 1/1] pcre: Change download location
 >> 
 >> The location at ftp.csx.cam.ac.uk only stores 2 latest versions of PCRE.
 >> This results in old (2015.11 and older currently) buildroot versions
 >> timing out on wget several times and having to retrieve the package
 >> from sources.buildroot.org afterwards.
 >> 
 >> Signed-off-by: Oleg Kitain <okitain@ya.ru>
 >> ---
 >> package/pcre/pcre.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Applied to master, thanks. Peter: do we want this sort of fix in the
 > LTS release?

I'm a bit confused about the description. To me it sounds like a local
firewall issue with ftp access instead, but OK - Others might have a
similar setup.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
