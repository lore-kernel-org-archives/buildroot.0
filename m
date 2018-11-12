From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Nov 2018 22:37:30 +0100
Subject: [Buildroot] [PATCH 1/4] linux: enable MICROCODE_INTEL if
 intel-microcode is selected
In-Reply-To: <20181104210241.20237-2-casantos@datacom.com.br> (Carlos Santos's
 message of "Sun, 4 Nov 2018 19:02:38 -0200")
References: <20181104210241.20237-1-casantos@datacom.com.br>
 <20181104210241.20237-2-casantos@datacom.com.br>
Message-ID: <87muqe565h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > We already turn on kernel features for several packages, so let's do it
 > for intel-microcode too, otherwise it's impossible to load the microcode
 > (by means of iucode-tools).

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
