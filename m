From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 07 Jul 2015 12:36:48 -0300
Subject: [Buildroot] [PATCH 4/4] popt: add hash file
In-Reply-To: <20150707165315.120c39d6@free-electrons.com>
References: <1436273552-2877-1-git-send-email-gustavo@zacarias.com.ar>	<1436273552-2877-4-git-send-email-gustavo@zacarias.com.ar>	<20150707141712.GA12326@tarshish>	<559BDFF4.4010003@zacarias.com.ar>	<20150707142731.GB12326@tarshish>	<559BE37B.7090708@zacarias.com.ar>
 <20150707165315.120c39d6@free-electrons.com>
Message-ID: <559BF210.4080105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/07/15 11:53, Thomas Petazzoni wrote:

> Though our policy so far is to have the upstream hash when available,
> and if it's too weak complement it with a locally calculated stronger
> hash.

Yes, but this is a mirror hash, not an upstream one.
There are no hashes @ http://rpm5.org/files/popt/
Hence it's a "locally calculated" plus "i've also checked the mirror md5".
Regards.
