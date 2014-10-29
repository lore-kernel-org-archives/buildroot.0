From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 22:11:07 +0100
Subject: [Buildroot] [PATCH v5] cppunit: new package
In-Reply-To: <1414541689-10361-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1414541689-10361-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20141029221107.78de6fa6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sebastien Bourdelin,

On Tue, 28 Oct 2014 20:14:49 -0400, Sebastien Bourdelin wrote:
> CppUnit is the C++ port of the famous JUnit framework for unit testing.
> Test output is in XML or text format for automatic testing and GUI
> based for supervised tests.
> 
> http://www.freedesktop.org/wiki/Software/cppunit/
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>

Applied, thanks, after doing a few changes:

    [Thomas:
      - change license to LGPLv2.1, since there is no indication that the
        "or later" option is used.
      - slightly rewrap text in Config.in file.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
