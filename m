From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 12:01:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-04-27
In-Reply-To: <20170428110851.03eff198@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 28 Apr 2017 11:08:51 +0200")
References: <20170428062842.1E44E20E06@mail.free-electrons.com>
 <20170428084433.7pb5lamlgxy2hzau@tarshish>
 <20170428110851.03eff198@free-electrons.com>
Message-ID: <87shksj1g9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri, 28 Apr 2017 11:44:33 +0300, Baruch Siach wrote:

 >> Incompatibility of ola with protobuf 3.2.0. An upstream issue[1] is open since 
 >> January.
 >> 
 >> Should we revert the protobuf bump? Remove ola?

 > Remove ola is I believe the right approach. According to the Github
 > issue, Fedora has done the same thing.

 > I believe it's more important to stay up-to-date with protobuf than it
 > is to keep ola as a package, especially since ola is not used as a
 > dependency for any other package.

 > Maybe just mark it BROKEN for now?

Yes, I think that is the best way forward as well.

-- 
Bye, Peter Korsgaard
