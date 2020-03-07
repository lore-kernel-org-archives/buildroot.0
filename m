From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Mar 2020 09:06:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pyqt5: select
 BR2_PACKAGE_QT5BASE_GUI
In-Reply-To: <27821b18-b923-ff87-9da9-f56e65d78a45@mind.be> (Arnout
 Vandecappelle's message of "Thu, 23 Jan 2020 23:39:45 +0100")
References: <20191230214842.1485805-1-fontaine.fabrice@gmail.com>
 <20191230234259.5bfe6355@windsurf> <20200112230647.1fce0393@windsurf>
 <CAPi7W83tq1Lcfh6jsREDkS7dc7k8HKrp+50hwDCCZyQEbkq8Zg@mail.gmail.com>
 <27821b18-b923-ff87-9da9-f56e65d78a45@mind.be>
Message-ID: <874kv08u7r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 12/01/2020 23:23, Fabrice Fontaine wrote:
 >> Le dim. 12 janv. 2020 ? 23:06, Thomas Petazzoni
 >> <thomas.petazzoni@bootlin.com> a ?crit :
 >>> 
 >>> Fabrice,
 >>> 
 >>> Any comment on the below question ?
 >> This is indeed "strange" but configure.py is really passing -gui
 >> unconditionally for QtCore (as well as QtDbus, QtNetwork ...).

 >  I've added a bit of this explanation to the commit message and applied to
 > master, thanks!

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
