From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 14:55:02 +0100
Subject: [Buildroot] [v2 1/1] merge_config.sh: add br2-external support
In-Reply-To: <1515497863-13204-1-git-send-email-ilya.kuzmich@gmail.com> (Ilya
 Kuzmich's message of "Tue, 9 Jan 2018 14:37:43 +0300")
References: <20171230175829.GH2921@scaer>
 <1515497863-13204-1-git-send-email-ilya.kuzmich@gmail.com>
Message-ID: <87a7ww7osp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ilya" == Ilya Kuzmich <ilya.kuzmich@gmail.com> writes:

 > Pass BR2_EXTERNAL value via -e option.
 > This will prevent merge_config.sh from silently eating any symbols defined in
 > external trees on a clean buildroot tree invocation.

 > Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>

 > ---
 > Changes v1 -> v2:
 > Simplifications

 > Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
