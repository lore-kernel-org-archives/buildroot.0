From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 06 Nov 2012 10:01:23 +0100
Subject: [Buildroot] [PATCHv2 02/10] target/generic: add filesystem
 overlay option
In-Reply-To: <5096B1BE.7010802@lucaceresoli.net>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
 <1351063027-13800-3-git-send-email-arnout@mind.be>
 <5096B1BE.7010802@lucaceresoli.net>
Message-ID: <5098D1E3.30703@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 04/11/2012 19:19, Luca Ceresoli wrote:
> Arnout Vandecappelle (Essensium/Mind) wrote:
>> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>>
>> The filesystem overlay is a tree that is copied over the target fs
>> after building everything - which is currently usually done in the
>> post-build script.
>>
>> Also replace the documentation for a custom skeleton with the
>> filesystem overlay and deprecate the custom skeleton.

Ah, the last 5 comment words are not true anymore.

Luca
