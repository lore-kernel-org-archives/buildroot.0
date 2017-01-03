From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Jan 2017 23:49:21 +0100
Subject: [Buildroot] [PATCH 2/2] collectd: fix riemann write plugin
	dependencies
In-Reply-To: <20161228221806.32321-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 28 Dec 2016 23:18:06 +0100")
References: <20161228221806.32321-1-peter@korsgaard.com>
 <20161228221806.32321-2-peter@korsgaard.com>
Message-ID: <87d1g34v4e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.org/results/fe5/fe5b5ed6355a794e84894c4aaf62eda6529ed184/
 > http://autobuild.buildroot.org/results/6c3/6c393cffb6ad4e676e311e9fc23ddbb2bcc2cf36/

 > The plugin uses the riemann-c-client library since commit d55584214206
 > (write_riemann: Use riemann-c-client), so adjust the dependencies to match.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
