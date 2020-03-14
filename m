From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 17:50:48 +0100
Subject: [Buildroot] [PATCH] package/python3: bump to version 3.8.2
In-Reply-To: <20200227082214.21154-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 27 Feb 2020 09:22:13 +0100")
References: <20200227082214.21154-1-peter@korsgaard.com>
Message-ID: <87o8syvq1j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Bugfix release, fixing a number of issues.  For details, see the
 > announcement:

 > https://docs.python.org/release/3.8.2/whatsnew/changelog.html#python-3-8-2-final

 > Adjust the spacing in the hash file and update the hash of the license file
 > for a change in copyright years:

 > -2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019 Python Software Foundation;
 > +2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020 Python Software Foundation;

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.11.x, thanks. For 2019.02.x I will instead bump to
3.7.7.

-- 
Bye, Peter Korsgaard
