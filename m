From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Sep 2013 08:12:25 +0200
Subject: [Buildroot] [PATCH v2] Add support for plain URL in
	$(PKG)_PATCH variable
In-Reply-To: <1368460312-9566-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Mon, 13 May 2013 17:51:52 +0200")
References: <517A1C3D.1010009@mind.be>
 <1368460312-9566-1-git-send-email-jezz@sysmic.org>
Message-ID: <87txhxyxbq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 J?r?me> Until now, $(PKG)_PATCH allow only to download patches from same URL than tarball.
 J?r?me> This patch allow to detect when plain URL are used in $(PKG)_PATCH and correctly
 J?r?me> handle them.

 J?r?me> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

 J?r?me> ---
 J?r?me> v2: 
 J?r?me>   - Rebase to apply to HEAD
 J?r?me>   - Drop patch called "Add $(PKG_NAME) in name of downloaded patches" since I am
 J?r?me>     not personally convinced of its usefulness

Committed, thanks.

-- 
Bye, Peter Korsgaard
