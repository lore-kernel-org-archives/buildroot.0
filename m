From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Nov 2008 10:41:45 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20081104082320.667f3022@surf> (Thomas Petazzoni's message of
	"Tue\, 4 Nov 2008 08\:23\:20 +0100")
References: <20081103201104.190E7F8015@busybox.net>
	<20081104082320.667f3022@surf>
Message-ID: <87prlb96au.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Mon,  3 Nov 2008 12:11:04 -0800 (PST),
 Thomas> jacmet at uclibc.org a ?crit :

 >> Log:
 >> Makefile: ignore glib-genmarshal in staging_dir

 Thomas> I haven't looked at the details, but do this also solve #5724
 Thomas> (http://busybox.net/bugs/view.php?id=5724) ?

That looks more like a problem about glib-genmarshal not being
installed on the host (E.G. something like a libglib2.0-dev package)

-- 
Bye, Peter Korsgaard
