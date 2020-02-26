From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 16:26:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/vala: bump version to 0.46.6
In-Reply-To: <20200225232826.958260-1-aduskett@gmail.com> (aduskett's message
 of "Tue, 25 Feb 2020 15:28:26 -0800")
References: <20200225232826.958260-1-aduskett@gmail.com>
Message-ID: <87lfop74jj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Also add the line "HOST_VALA_CONF_OPTS += --disable-valadoc"
 > as valadoc requires libgvc which is not available in Buildroot.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I take it this is meant for next? If not, why?

-- 
Bye, Peter Korsgaard
