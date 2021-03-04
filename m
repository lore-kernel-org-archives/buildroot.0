From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Mar 2021 21:24:17 +0100
Subject: [Buildroot] [PATCH] package/python3: security bump to version
 3.9.2
In-Reply-To: <87o8g8y62r.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 25 Feb 2021 08:11:56 +0100")
References: <20210223135031.23198-1-peter@korsgaard.com>
 <87o8g8y62r.fsf@dell.be.48ers.dk>
Message-ID: <874khqhdla.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 >> Fixes the following security issue:
 >> - CVE-2021-23336: urllib.parse.parse_qsl(): Web cache poisoning - `; ` as a
 >> query args separator
 >> https://bugs.python.org/issue42967

 >> And fixes a number of issues. For details, see the changelog:
 >> https://docs.python.org/release/3.9.2/whatsnew/changelog.html

 >> Drop the now upstreamed security patch and update the license hash for a
 >> change of copyright year:

 >> -2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020 Python Software Foundation;
 >> +2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021 Python Software Foundation;

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.11.x, thanks. For 2020.02.x, I will instead bump to
3.8.8.

-- 
Bye, Peter Korsgaard
