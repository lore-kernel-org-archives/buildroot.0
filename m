From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 01 Oct 2010 10:31:55 +0200
Subject: [Buildroot] [SECURITY][PATCHv2] Bump quagga to 0.99.17
In-Reply-To: <20100930234735.4ffdc3ea@surf> (Thomas Petazzoni's message of
	"Thu, 30 Sep 2010 23:47:35 +0200")
References: <4CA4A278.6040303@zacarias.com.ar>
	<87ocbfxcsg.fsf@macbook.be.48ers.dk> <4CA4E521.30407@zacarias.com.ar>
	<87k4m3xbc1.fsf@macbook.be.48ers.dk> <20100930234735.4ffdc3ea@surf>
Message-ID: <877hi2xqis.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Thu, 30 Sep 2010 21:47:42 +0200
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> Could someone using the external toolchain (Thomas?) give netsnmp a
 >> quick test?

 Thomas> I confirm that since Gustavo converted the package to autotargets, the
 Thomas> previously existing build failures with external toolchain have
 Thomas> disappeared. I just tested with a recent (a few days) Git, and net-snmp
 Thomas> built just fine with an external ARM CodeSourcery toolchain.

 Thomas> Now, I have no idea if it actually works, since I don't know how to
 Thomas> test it. But that's another story :-)

Thanks - Did you also build something using netsnmp
(E.G. BR2_PACKAGE_QUAGGA_SNMP)? The problem was afaik dependent packages
not finding netsnmp.

-- 
Bye, Peter Korsgaard
