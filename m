From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 13:33:28 +0200
Subject: [Buildroot] [PATCH v2 next 06/11] gst1-plugins-bad: add Image
	Quality Assessment (IQA) plugin
In-Reply-To: <20170512101807.42378-6-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Fri, 12 May 2017 11:18:02 +0100")
References: <20170512101807.42378-1-Vincent.Riera@imgtec.com>
 <20170512101807.42378-6-Vincent.Riera@imgtec.com>
Message-ID: <8760f84et3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This plugin replaces the recently removed videomeasure plugin.
 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 > Changes v1 -> v2:
 > - Specify that this plugin replaces the videomeasure plugin in
 >   Config.in.legacy

Committed, thanks.

You are not handling audiobuffersplit/audiomixmatrix/msdk/ttml plugins,
so I've added extra commits handling those.

-- 
Bye, Peter Korsgaard
