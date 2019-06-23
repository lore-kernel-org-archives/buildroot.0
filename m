From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 21:20:33 +0200
Subject: [Buildroot] [PATCH v3,1/2] package/mpd: drop tremor select
In-Reply-To: <20190601143456.23326-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 1 Jun 2019 16:34:55 +0200")
References: <20190601143456.23326-1-fontaine.fabrice@gmail.com>
Message-ID: <878stsds72.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop tremor select added by commit
 > d428dddf680b067c13ba9a08bfd502c7286cffe7

 > Indeed, nowadays, mpd can be built successfully even if there is no
 > input plugin selected

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
