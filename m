From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 20:59:51 +0200
Subject: [Buildroot] [git commit] libglib2: disable compiler warnings
In-Reply-To: <20170719152348.66d289c3@windsurf> (Thomas Petazzoni's message of
 "Wed, 19 Jul 2017 15:23:48 +0200")
References: <20170704170700.6316E81E06@busybox.osuosl.org>
 <87d18wbmc1.fsf@dell.be.48ers.dk> <20170719152348.66d289c3@windsurf>
Message-ID: <87inio5k2g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Committed to 2017.02.x and 2017.05.x, thanks.

 > Doesn't do much harm, but it wasn't causing any visible issue in
 > 2017.02/2017.05 I believe. It's really enabling the uClibc-ng intl stub
 > that triggered that warning.

Correct, I added it as it seemed "safe", and would fix any other
warnings that would trigger Werror failures.

-- 
Bye, Peter Korsgaard
